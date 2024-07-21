NAME = libftprintf.a
LIBFT = libft.a

SRCS = ./srcs/
INCL = ./includes/

WFLAGS = -Wall -Wextra -Werror

CFILES = $(SRCS)ft_print_char.c $(SRCS)ft_print_hex.c $(SRCS)ft_print_int.c $(SRCS)ft_print_perc.c $(SRCS)ft_print_ptr.c $(SRCS)ft_print_str.c $(SRCS)ft_print_uns.c $(SRCS)ft_printf.c $(SRCS)ft_putnbr_dec_to_hex.c $(SRCS)ft_set_data.c  
OFILES = $(CFILES:.c=.o)

all: $(NAME)

$(NAME): $(OFILES)
	cd libft && $(MAKE)
	cp libft/$(LIBFT) $(NAME)
	ar rcs $(NAME) $(OFILES)

$(SRCS)%.o: $(SRCS)%.c -I$(INCL)
	$(CC) $(WFLAGS) -c $(CFILES)

clean: 
	rm -f $(OFILES)
	cd libft && $(MAKE) clean

fclean: clean
	rm -f $(NAME)
	cd libft && $(MAKE) fclean

re: fclean all
	cd libft && $(MAKE) re

.PHONY: all clean fclean re
