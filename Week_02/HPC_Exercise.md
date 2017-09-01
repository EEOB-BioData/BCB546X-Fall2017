##BCB/EEOB546X: HPC Exercise

In this exercise we will practice logging into an HPC resource (hpc-class), editing an existing SLURM script using the UNIX editor known as "vi", scheduling a job using this SLURM script, monitoring the job while it runs, and deleting our active job.

First, log into hpc-class by typing the following into your Terminal or GitBash application:

```
$ ssh <ISU NetID>@hpc-class.its.iastate.edu
```

or, if you've successfully created a `config` file in your `.ssh` folder:

```
$ ssh hpc_class
```

Again, the password for hpc-class.its.iastate.edu is the same as that for CyMail.

Once you have successfully logged on, `cd` into your `BCB546X-Fall2017` folder and update the folder using the command:

```
$ git pull origin master
```

Now, once you `cd` into your `Week_02` folder, you should see a shell script titled `blastn.sh`.  This is a SLURM script for submitting a blast job.  Open and inspect the shell script using the following command:

```
$ vi blastn.sh
```
This will open the file using Visual Editor or "Vi", which is the default editor that comes with the UNIX operating system. You will see that this script has all the SLURM script components that we discussed in class. Use the Vi editor to change the wall time from 3 to 2 hours and to add your netID in the line indicating "mail-user". A Vi cheatsheat can be found here:

[Vi Help Sheet](https://www.smashingmagazine.com/wp-content/uploads/2010/05/VI-Help-Sheet-011.pdf)

Useful commands will include `i` for "insert", `x` for "delete" and `:x` for "save and exit"

Once you have the SLURM script edited and ready to go, `cd` into your `in_class` folder and launch the script from there.  You'll need the path to the SLURM script so it may be useful to copy the results of a `pwd` before leaving the `Week_02` folder.  For example, to schedule the job from my 	`in_class` folder, I would type:

`$ sbatch /home/mhufford/BCB546X-Fall2017/Week_02/blastn.sh`

Now, monitor the job using commands we learned in class:

* `squeue`

* `squeue -u`

* `squeue -t`

Also, try an `ls` in your `in_class` folder once you receive an email that your job has launched.  What new files do you see?

Let the job run for 20-30 minutes, using the `head` or `cat` commands to monitor the contents of your standard error, standard out, and results files, then cancel the job using the following command:

```
$ scancel <process ID>
```
Where `<process ID>` is the number you were given when you scheduled the job and that is also listed when you inspect `squeue`

***Nice work! You're on your way to using HPC resources!***

