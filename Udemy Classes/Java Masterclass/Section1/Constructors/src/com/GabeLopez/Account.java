package com.GabeLopez;
import java.util.Random;


public class Account {
    private int number;
    private double balance;
    private String customerName;
    private String email;
    private String phoneNumber;

    public Account() {
        Random rand = new Random();
        number = rand.nextInt(1000);
        balance = 0.0;
        customerName = "Steve NeedsAName";
        email = "newEmail.com";
        phoneNumber = "(555) 555-5555";
    }

    public void deposit(double num){
        balance += num;
    }

    public void withdraw(double num){
        if(num < balance){
            balance -= num;
        }
        else {
            System.out.println(num + " is greater than " + balance);
        }
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getNumber() {
        return number;
    }

    public void setBalance(double balance){
        this.balance = balance;
    }

    public double getBalance() {
        return balance;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    String getCustomerName() {
        return customerName;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }
}
