#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include "bloom.h"

const int BLOOM_HASH1 = 17;
const int BLOOM_HASH2 = 29;

// compute a hash of a string using a seed value, where the result
// falls between zero and range-1
int hash_string(char * string, int seed, int range)
{
  int i;
  int hash = 0;

  // simple loop for mixing the input string
  for ( i = 0; string[i] != '\0'; i++ ) {
    hash = hash * seed + string[i];
  }
  // check for unlikely case that hash is negative
  if ( hash < 0 ) {
    hash = -hash;
  }
  // bring the hash within the range 0..range-1
  hash = hash % range;
  
  return hash;
}



// create a new, empty Bloom filter with 'size' slots
struct bloom * bloom_new(int size)
{
	struct bloom * p;						//points to bitset
	p = malloc(sizeof(struct bloom));		//allocate memory for bitset
	p-> bit_vector = bitset_new(size);
	p -> size = size;						//get size
	p ->bytes_needed = size/8;			
	if(size%8 !=0)							//find bytes needed
	{
		p-> bytes_needed++;
	}
	p -> data = malloc(p->bytes_needed);		//allocate memory for bytes needed
	return p;
};

// check to see if a string is in the set
int bloom_lookup(struct bloom * this, char * item)
{
	//look for 1st hash value
 	int hash_value = hash_string(item, BLOOM_HASH1, this->size);
	//int byte_index = hash_value/8;
	//unsigned char byte = this-> data[byte_index];
	//int bit_index = hash_value % 8;
	//int set1 = (byte >> bit_index) & 0x01;
	int set1 = bitset_lookup(this->bit_vector, hash_value);

	//look for 2nd hash value
	hash_value = hash_string(item, BLOOM_HASH2, this->size);
	//byte_index = hash_value/8;
	//byte = this-> data[byte_index];
	//bit_index = hash_value % 8;
	//int set2 = (byte >> bit_index) & 0x01;
	int set2 = bitset_lookup(this->bit_vector, hash_value);
	
	return set1 & set2;
}

// add a string to the set has no effect if the item is already in the
// set; note that you cannot safely remove items from a Bloom filter
void bloom_add(struct bloom * this, char * item)
{
	if(!bloom_lookup(this, item))
	{
		//add 1st hash value
		int hash_value = hash_string(item, BLOOM_HASH1, this->size);
		//int byte_index = hash_value/8;
		/*unsigned char byte = this-> data[byte_index];
		int bit_index = hash_value % 8;
		unsigned char mask = 1;
		byte = (mask << bit_index) | byte;
		this-> data[byte_index] = byte;	
*/
		bitset_add(this->bit_vector, hash_value);

		//add 2nd hash value
		hash_value = hash_string(item, BLOOM_HASH2, this->size);
		/*byte_index = hash_value/8;
		byte = this-> data[byte_index];
		bit_index = hash_value % 8;
		mask = 1;
		byte = (mask << bit_index) | byte;
		this-> data[byte_index] = byte;*/

		bitset_add(this->bit_vector, hash_value);

	}
}

// place the union of src1 and src2 into dest
void bloom_union(struct bloom * dest, struct bloom * src1,
		  struct bloom * src2)
{
	assert(src1->size == src2->size);
	for(int i=0; i<src1->bytes_needed; i++)
	{
		dest->data[i] = src1->data[i] | src2-> data[i];
		//printf("Union: %d \n", dest->data[i]);
	}
}

// place the intersection of src1 and src2 into dest
void bloom_intersect(struct bloom * dest, struct bloom * src1,
                  struct bloom * src2)
{
	assert(src1->size == src2->size);
	for(int i=0; i<src1->bytes_needed; i++)
	{
		dest->data[i] = src1->data[i] & src2-> data[i];
		//printf("Intersection: %c \n", dest->data[i]);
	}
}

// print out the bits that are 1 in the bit vector of
// a bloom filter
void bloom_print(struct bloom * this)
{
  bitset_print(this->bit_vector);
}
