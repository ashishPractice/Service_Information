package com.infowave.informationsystem.model;

public class Counter
{
    private int count;

    public Counter()
    {
        count = 0;
    }

    public Counter(int init)
    {
        count = init;
    }

    public int get()
    {
        return count;
    }

    public void clear()
    {
        count = 0;
    }

    public void incrementAndGet()
    {
        count  = count +1;
    }

    public void nothing()
    {
        count  = count;
    }

    public String toString()
    {
        return ""+count;
    }
}
