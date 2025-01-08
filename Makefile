SRC=	\
	main.c \

OBJ = $(SRC:.c=.o)

CC = cc
INCLUDES= -Io_O
FLAGS=-Wall -Wextra -Werror 
LIBS=$(MINILIBX_LIB)

SERVER = srkvs 
CLIENT_LIB = libsrkvs.a

SHELL = bash

RESET = \x1b[1;0m
BLACK = \x1b[1;30m
RED = \x1b[1;31m
GREEN = \x1b[1;32m
YELLOW = \x1b[1;33m
BLUE = \x1b[1;34m
PURPLE = \x1b[1;35m
CYAN = \x1b[1;36m
WHITE = \x1b[1;37m

BORDER_C = $(PURPLE)

CAT_C = $(PURPLE)
#Oo_oO#Oo_oO#Oo_oO

define box
	@tput civis
	$(if $(filter $(3), 0), ,@tput cuu $(3))
	@printf "$(BORDER_C)%s%s%s%16s\n" "╘╪" "─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─" "╪╛" ""
	@printf "%-20s $(1)%-29s$(RESET)$(BORDER_C)%s%16s\n" "╞╫" "$(2)" "╫╡" ""
	@printf "%s%s%s$(RESET)%16s\n" "╒╪" "─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─═─" "╪╕" ""
	@tput cnorm	
endef


$(TARGET): cat setup $(OBJ)


setup:

cat: 
	@printf "%51s $(CAT_C)⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀ \n"			""	
	@printf "%51s $(CAT_C)⠀⠀⠀⠀⢀⡴⣆⠀⠀⠀⠀⠀⣠⡀⠀⠀⠀⠀⠀⠀⣼⣿⡗⠀⠀⠀⠀\n"			""
	@printf "%51s $(CAT_C)⠀⠀⠀⣠⠟⠀⠘⠷⠶⠶⠶⠾⠉⢳⡄⠀⠀⠀⠀⠀⣧⣿⠀⠀⠀⠀⠀\n"			" ___________________ ____  __.____   _____________"
	@printf "%51s $(CAT_C)⠀⠀⣰⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣤⣤⣤⣤⣤⣿⢿⣄⠀⠀⠀⠀\n"			"/   _____/\______   \    |/ _|\   \ /   /   _____/"
	@printf "%51s $(CAT_C)⠀⠀⡇⠀$(RED)x⠀⠀⠀⠀⠀x$(CAT_C)⠀⠀⠀⠀⣧⠀⠀⠀⠀⠀⠀⠙⣷⡴⠶⣦\n"	"\_____  \   |       _/      <  \   Y   /\_____  \ "
	@printf "%51s $(CAT_C)⠀⠀⢱⡀⠀ ⠉⠉⠀⠀⠀  ⠀⢠⡟⠂⠀⠀⢀⣀⣠⣤⠿⠞⠛⠋\n"			" /        \ |    |   \    |  \  \     / /        \\"
	@printf "%51s $(CAT_C)⣠⠾⠋⠙⣶⣤⣤⣤⣤⣤⣀⣠⣤⣾⣿⠴⠶⠚⠋⠉⠁⠀⠀⠀⠀⠀⠀\n"			"/_______  / |____|_  /____|__ \  \___/ /_______  /"
	@printf "%51s $(CAT_C)⠛⠒⠛⠉⠉⠀⠀⠀⣴⠟⣣⡴⠛⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n"			"        \/         \/        \/                \/ "
	@printf "%51s $(CAT_C)⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n"			""

%.o: %.c
	$(call box, $(YELLOW), $<, 0)
	@$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@ 
	$(call box, $(GREEN), $<, 3)

all: $(TARGET)

re: clean all

clean: cat 
	$(call box, $(RED), CLEANING OBJECTS, 0)
	@rm -f $(OBJ)
	$(call box, $(GREEN), CLEANING OBJECTS, 3)
	$(call box, $(RED), CLEANING LIBS, 0)
	$(call box, $(GREEN), CLEANING LIBS, 3)
fclean: cat clean
	$(call box, $(RED), CLEANING, 0)
	@rm -f $(NAME)
	$(call box, $(GREEN), CLEANING, 3)

.PHONY: all re clean fclean cat

