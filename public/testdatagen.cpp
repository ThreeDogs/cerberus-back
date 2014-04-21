#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define EVENTS 20
#define LOOP 40

int prevActivity=0;
float prevtime=0;
char activity[5][16] = {"activity1","activity2","activity3","activity4","activity5"};
char event[4][16] = {"click","setdate","optionmenu","hardkey"};

char *randstring(size_t length)
{
    static char charset[] = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";        
    char *randomString = NULL;
    int key;

    if (length) {
        randomString = (char*) malloc(sizeof(char) * (length+1));
        if (randomString) {     
            for (int n = 0;n < length;n++) {            
                key = rand() % (int)(sizeof(charset)-1);
                randomString[n] = charset[key];
            }
            randomString[length] = '\0';
        }
    }

    return randomString;
}

char *randactivity()
{
	if ( rand()%10 < 3 ) prevActivity = rand()%5;
	return activity[prevActivity];
}

char * randeventtype()
{
	return event[rand()%4];
}

float randtime()
{
	prevtime = prevtime + 1 + rand()%3 + (rand()%10)*0.1;
	return prevtime;
}

int main()
{

	FILE *file = fopen("testdata.json","w+");
	int cpu_percentage;
	int nh_size_rand, nh_alloc_rand;
	int dh_size_rand, dh_alloc_rand;
	int h_size, h_alloc;

	srand(time(NULL));

	fprintf(file, "{\n");

	//events info generation
	fprintf(file, "\t\"motion_reports\":[\n");
	for(int i=0; i<EVENTS; i++)
	{
		fprintf(file, "\t\t{\n");

		fprintf(file, "\t\t\t\"time_stamp\": %.1f,\n", randtime());
		fprintf(file, "\t\t\t\"id\": %d,\n", i);
		fprintf(file, "\t\t\t\"activity_class\": \"%s\",\n", randactivity());
		fprintf(file, "\t\t\t\"param\": \"%s\",\n", randstring(8));
		fprintf(file, "\t\t\t\"action_type\": \"%s\",\n", randeventtype());
		fprintf(file, "\t\t\t\"view\": \"%s\"\n", randstring(8));

		if(i==EVENTS-1) fprintf(file, "\t\t}\n");
		else fprintf(file, "\t\t},\n");
	}
	fprintf(file,"\t],\n");

	//cpu info generation
	fprintf(file, "\t\"cpu_reports\":[\n");
	for(int i=0; i<LOOP; i++)
	{
		cpu_percentage = rand() % 100;
		fprintf(file, "\t\t{\n");

		fprintf(file, "\t\t\t\"id\": %d,\n", i);
		fprintf(file, "\t\t\t\"usage\": %d\n", cpu_percentage);
		
		if(i==LOOP-1) fprintf(file, "\t\t}\n");
		else fprintf(file, "\t\t},\n");
	}
	fprintf(file,"\t],\n");

	//mem info generation	
	fprintf(file, "\t\"memory_reports\":[\n");
	for(int i=0; i<LOOP; i++)
	{
		nh_size_rand = rand() % 10000;
		dh_size_rand = rand() % 20000;
		nh_alloc_rand = rand() % nh_size_rand;
		dh_alloc_rand = rand() % dh_size_rand;
		h_size = nh_size_rand + dh_size_rand;
		h_alloc = nh_alloc_rand + dh_alloc_rand;

		fprintf(file, "\t\t{\n");

		fprintf(file, "\t\t\t\"id\": %d,\n", i);
		fprintf(file, "\t\t\t\"native_heap_size\": %d,\n", nh_size_rand );
		fprintf(file, "\t\t\t\"native_heap_alloc\": %d,\n", nh_alloc_rand );
		fprintf(file, "\t\t\t\"dalvik_heap_size\": %d,\n", dh_size_rand );
		fprintf(file, "\t\t\t\"dalvik_heap_alloc\": %d,\n", dh_alloc_rand );
		fprintf(file, "\t\t\t\"mem_total\": %d,\n", h_size );
		fprintf(file, "\t\t\t\"mem_alloc\": %d\n", h_alloc );
		
		
		if(i==LOOP-1) fprintf(file, "\t\t}\n");
		else fprintf(file, "\t\t},\n");
	}
	fprintf(file,"\t]\n");


	fprintf(file,"}");
	fclose(file);

	return 0;
}