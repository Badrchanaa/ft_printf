CC = cc
CFLAGS = -Wall -Wextra -Werror
NAME = libftprintf.a
LIBFT_NAME = libft/libft.a
SRC = ft_common_utils.c ft_print_utils.c ft_printf.c ft_flags_utils.c
OBJ = $(SRC:.c=.o)

all: $(NAME)

$(NAME): $(LIBFT_NAME) $(OBJ)
	cp $< $@
	ar -rcs $@ $(OBJ)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

$(LIBFT_NAME):
	make --directory libft

bonus: $(NAME)

clean:
	rm -f $(OBJ)
	make clean --directory libft

fclean: clean
	rm -f $(NAME)
	make fclean --directory libft

re: fclean all

.PHONY: all fclean clean re
