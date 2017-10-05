package com.GabeLopez;

public class Main {
    public static void main(String[] args) {
        Account bankAccount = new Account();
        bankAccount.setBalance(1000.51);
        System.out.println("Current Balance: " + bankAccount.getBalance());

        bankAccount.withdraw(100.10);
        System.out.println("After withdraw Balance: " + bankAccount.getBalance());

        bankAccount.deposit(50);
        System.out.println("After deposit Balance: " + bankAccount.getBalance());

        bankAccount.withdraw(1000.10);
        System.out.println("After withdraw Balance: " + bankAccount.getBalance());
    }
}
