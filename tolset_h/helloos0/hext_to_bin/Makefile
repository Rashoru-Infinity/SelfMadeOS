CC	= gcc
CFLAGS	= -Wall -Wextra -Werror -g3
SRCS	= hext_to_bin.c
NAME	= hext_to_bin
INC	= -Iread_file/includes -Iincludes
LINK	= -Lread_file -lreadfile
RM	= rm -f

all	:	$(NAME)

$(NAME)	:	$(SRCS)
	$(MAKE) -C read_file all
	$(CC) $(CFLAGS) $(SRCS) $(INC) -o $(NAME) $(LINK)

clean	:
	$(MAKE) -C read_file clean

fclean	:
	$(MAKE) -C read_file fclean
	$(RM) $(NAME)

re	: fclean all

.PHONY	:	clean fclean all re
