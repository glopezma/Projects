package com.GabeLopez;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
      
	    int choice;
	    System.out.println("Welcome to Quicky Mart! \n what would you like to buy? ");
      menu();
      Scanner in = new Scanner(System.in);
      choice = in.next();
      while(choice != 'q'){
        switch(choice) {
          case 1:

            break;
          case 2:

            break;
          case 3:

            break;
          case 4:

            break;
          case 5:

            break;
          case 6:

            break;
          case 7:

            break;
          default:
            System.out.println("That's not an option! \n")
        }
      }
    }

    public void menu() {
      System.out.println("\n ****** Food ****** ");
      System.out.println("1. Hot Dog   -- $1.50");
      System.out.println("2. Candy Bar -- $1.00");
      System.out.println("3. Chips     -- $0.50");
      System.out.println("4. Candy Bar -- $1.00");
      System.out.println("\n ****** Drinks ****** ");
      System.out.println("5. Soda Pop  -- $1.50");
      System.out.println("6. Coffee    -- $1.50");
      System.out.println("7. Bottled Water  -- $1.50");
      System.out.println("q to quit");
    }
}
