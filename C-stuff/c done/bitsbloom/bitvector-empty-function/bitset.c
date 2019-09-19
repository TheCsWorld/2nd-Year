#include <stdlib.h>
#include <assert.h>
#include <stdio.h>

#include "bitset.h"



//struct bitset
//{
//	int size;
//	unsigned char * data;
//	unsigned bytes_needed;
//};
// create a new, empty bit vector set with a universe of 'size' items
struct bitset * bitset_new(int size)
{
	struct bitset * p;						//points to bitset
	p = malloc(sizeof(struct bitset));		//allocate memory for bitset
	p -> size = size;						//get size
	p ->bytes_needed = size/8;			
	if(size%8 !=0)							//find bytes needed
	{
		p-> bytes_needed++;
	}
	p -> data = malloc(p->bytes_needed);		//allocate memory for bytes needed
	for(int i=0; i<p->bytes_needed;i++)
	{	
		p->data[i] = 0;

	}
	return p;
};


// get the size of the universe of items that could be stored in the set
int bitset_size(struct bitset * this)
{
	return this -> size;
}


// check to see if an item is in the set
int bitset_lookup(struct bitset * this, int item)
{
	int byte_index = item/8;
	unsigned char byte = this-> data[byte_index];
	int bit_index = item % 8;
	int set = (byte >> bit_index) & 0x01;
	return set;

}


// get the number of items that are stored in the set
int bitset_cardinality(struct bitset * this)
{
	int total = 0;
	for (int i=0; i<this->size; i++)
	{
		if(bitset_lookup(this, i))
		{
		total++;
		}
	}
	return total;
}



// add an item, with number 'item' to the set
// has no effect if the item is already in the set
void bitset_add(struct bitset * this, int item)
{
	if(!bitset_lookup(this, item))
	{
		int byte_index = item/8;
		unsigned char byte = this-> data[byte_index];
		int bit_index = item % 8;
		unsigned char mask = 1;
		byte = (mask << bit_index) | byte;
		this-> data[byte_index] = byte;	
	}
}


// remove an item with number 'item' from the set
void bitset_remove(struct bitset * this, int item)
{
	if(!bitset_lookup(this, item))
	{
		int byte_index = item/8;
		unsigned char byte = this-> data[byte_index];
		int bit_index = item % 8;
		unsigned char mask = 1;
		byte = (mask << bit_index) & byte;
		this-> data[byte_index] = byte;	
	}
}


// place the union of src1 and src2 into dest;
// all of src1, src2, and dest must have the same size universe
void bitset_union(struct bitset * dest, struct bitset * src1, struct bitset * src2)
{

	assert(src1->size == src2->size);
	for(int i=0; i<src1->bytes_needed; i++)
	{
		dest->data[i] = src1->data[i] | src2-> data[i];
		//printf("Union: %d \n", dest->data[i]);
	}
}


// place the intersection of src1 and src2 into dest
// all of src1, src2, and dest must have the same size universe
void bitset_intersect(struct bitset * dest, struct bitset * src1, struct bitset * src2)
{
	assert(src1->size == src2->size);
	for(int i=0; i<src1->bytes_needed; i++)
	{
		dest->data[i] = src1->data[i] & src2-> data[i];
		//printf("Intersection: %c \n", dest->data[i]);
	}
}	
                  	 

// print the contents of the bitset
void bitset_print(struct bitset * this)
{
  int i;
  int size = bitset_size(this);
  for ( i = 0; i < size; i++ ) {
    if ( bitset_lookup(this, i) == 1 ) {
      printf("%d ", i);
    }
  }
  printf("\n");
}

void error_bitset_print(struct bitset * this)
{
  int i;
  int size = bitset_size(this);
  for ( i = 0; i < size; i++ ) {
    if ( bitset_lookup(this, i) == 1 ) {
      fprintf(stderr, "%d ", i);
    }
  }
  fprintf(stderr,"\n");
}
  


