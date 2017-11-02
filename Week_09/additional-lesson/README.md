# Reading and Writing files in Python

## Reading from File

This is an additional lesson covering basic file input/output in Python. For this lesson, we will not use any fancy packages, just the core Python functions.

Start by pulling the course git repository and changing to the `BCB546X-Fall2017/Week_09/additional-lesson` directory.

In this directory is a file called `input.txt`. This file comprises 5 lines, each with a string of nucleotide data:

```
GCACATGCAGCGCAAGTAGGTCTACAAGACGCTACTTCCCCTATCATAGAAGAGCTTATC
GCCCATCCAGTACAATTCGGATTTCAAGACGCCGCCTCACCTATTATAGAA
GCCCACCCAGCCCAATTAGGATTCCAAGACGCCGCTTCCCCAAT
GCGTACCCATTTCAACTCGGATTACAGGACGCAACCTCCCCT
GCTTATCCACTTCAACTAGGATTTCAAGATGCAACATCCCCTATTATAGAAGAATTACTCCAT
```

We would like to read this file into our Python interpreter and print the length of each sequence in the file.

Start by opening a Python interpreter. This can be in spyder or Jupyter notebook or using your terminal. Just make sure that your working directory is `BCB546X-Fall2017/Week_09/additional-lesson`.

There are several ways to interact with the contents of this file, but first, we must create a file object to work with the file:

```
file = open('input.txt','r')
```

This will create a variable that opens the file we want to read. The argument `'r'` indicates that we will read from this file (and not write to it).

The simplest way to extract lines from this file is to go through it line-by-line using a `for` loop. 

```
for line in file:
	print(line)

file.close()
```

This will simply print each line and close the file.
If we want to store the sequences, we can create a variable to store each one as a list:

```
file = open('input.txt','r')
seqs = []
for line in file:
	seqs += [line.strip('\n')]

file.close()
```

Here we created a list called `seqs` and put each line of the file in the list. We used the `.strip()` method to remove all of the newlines at the end of each sequence so that the list only contains strings of nucleotides. By default, `.strip()` removes whitespace, so we didn't have to use the `\n` argument.

## Writing to File

Perhaps we wish to only write a single sequence to file in *fasta* format. If you BLAST the third sequence you will find that it matches the cytochrome oxidase subunit II gene of a (cute-looking) mouse lemur, *Microcebus murinus*. Let's write this to a new file called `M_murinus.fasta`.

The FASTA file format was developed for the [FASTA alignment software package](http://fasta.bioch.virginia.edu/fasta_www2/fasta_list2.shtml).

A FASTA file is a plain-text file for storing sequences. Each sequence is represented by 2 parts:

1. The description line starting with `>` 
2. The sequence (can be a single line or interleaved)

Let's first create a string with the description line:

```
fa_description = ">Microcebus murinus mitochondrial gene for COII"
```

Now we simply have to create a new file and write this string and the correct sequence to that file.

To open a new file for writing, we can also use the `open()` function:

```
out_file = open('M_murinus.fasta','w')
```

Note that this time we used the `'w'` argument to indicate that we will be writing to this file.

Now we can put stuff in the file:

```
out_file.write(fa_description + '\n')
```

This writes the fasta description and follows that by a newline.

Now we can write the sequence (remember that the mouse lemur is the 3rd sequence in our list, which means it is at index 2) and it often is nice to put a newline at the end:

```
out_file.write(seqs[2] + '\n')
```

And close the output file:

```
out_file.close()
```


## Exercise 1: Use a `for` loop to print the length of each sequence to the screen

Now we have a list of each sequence. Simply print the length of each one to the screen. You can loop through the list we named `seqs`. 

## Exercise 2: Write a fasta file for the 1st sequence 

Use [BLAST](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastn&PAGE_TYPE=BlastSearch&LINK_LOC=blasthome) to find the species of the first sequence in the `input.txt` file. 

Write a new fasta file with a description for this sequence.



