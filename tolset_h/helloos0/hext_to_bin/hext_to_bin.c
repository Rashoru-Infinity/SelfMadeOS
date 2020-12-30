#include <stdio.h>
#include "read_file.h"
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <stdint.h>

int main(int argc, char **argv)
{
	char	*source;
	char	dest;
	size_t	source_idx;
	int		bit;
	FILE	*fp;
	char	tmp;

	if (argc != 3)
	{
		printf("Usage : %s dest source\n", argv[0]);
		exit(1);
	}
	if (!(source = read_file(argv[2], 2048)))
	{
		perror("read_file\n");
		exit(1);
	}
	if (!(fp = fopen(argv[1], "w")))
	{
		perror("fopen\n");
		exit(1);
	}
	source_idx = 0;
	bit = 0;
	while (source[source_idx])
	{
		if (!isxdigit(source[source_idx]))
		{
			++source_idx;
			continue;
		}
		tmp = source[source_idx];
		if (bit == 0)
			dest = 0;
		dest += strtol(&tmp, NULL, 16);
		if (bit == 0)
			dest <<= 4;
		bit += 4;
		if (bit == 8)
		{
			fwrite(&dest, sizeof(char), 1, fp);
			bit = 0;
		}
		++source_idx;
	}
	if (bit == 4)
		fwrite(&dest, sizeof(char), 1, fp);
	fclose(fp);
	free(source);
}
