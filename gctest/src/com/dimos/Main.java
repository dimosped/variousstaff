package com.dimos;

import java.util.ArrayList;
import java.util.ArrayList;
import java.util.List;


class Memalloc implements Runnable {
    private final List<String> mylist;
    private final Object myLock;

    public Memalloc(Object myLock, List<String> mylist) {
        this.myLock = myLock;
        this.mylist =mylist;
    }

    @Override
    public void run() {
        while (true){
            synchronized (myLock){
                // Allocate a new chunk of data
                for (int i = 0; i < 6000; i++) {
                    String tmp = String.valueOf(System.currentTimeMillis());
                    mylist.add(tmp);
                }
            }// end of synchronized block

            // Sleep for some time
            try {
                Thread.sleep(300);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

class Counter implements Runnable{
    private final List<String> mylist;
    private final Object myLock;

    public Counter(Object myLock, List<String> mylist) {
        this.mylist = mylist;
        this.myLock = myLock;
    }

    @Override
    public void run() {
        while(true){
            int max = 0;
            synchronized (myLock){
                // Do the counting
                for (String str: mylist) {
                    if (str.length() > max){
                        max = str.length();
                    }
                }
            }
            if (max > 100)
                System.out.println("Too large rundom int. Impossible");
        }
    }
}

public class Main {
    private static volatile List<String> mylist = new ArrayList<String>();

    public static void main(String[] args) throws InterruptedException {

        final Object myLock = new Object();


        Thread allocT = new Thread(new Memalloc(myLock, mylist));
        //Thread countT = new Thread(new Counter(myLock, mylist));

        allocT.start();
        //countT.start();

        allocT.join();

    }
}
