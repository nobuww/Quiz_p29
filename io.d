module io;
import std.stdio;
import solver;

int[] parse_input(string path){
    File file = File(path, "r");
    int ncase;
    file.readf!"%d\n"(ncase);
    //writefln("%d", ncase);
    int[] data = new int[ncase];
    for(int i=0; i< ncase;i++){
        file.readf!"%d "(data[i]);
    }
    //print!(int).printArray(data);
    return data;
}

void printIntArray(int[] arr){
    foreach (int val; arr)
    {
        writeln(val);
    }
}

void printStringArray(string[] arr){
    foreach (string val; arr)
    {
        writeln(val);
    }
}

template print(T){
    void printArray(T[] arr){
        foreach (T val; arr)
        {
            writef("%d ", val);
        }
        writeln();
    }

    void printIndex(T[] arr){
        for(int i=0; i<arr.length; i++)
        {
            writef("%d ", arr[i].index);
        }
        writeln();
    }

    void printValue(T[] arr){
        for(int i=0; i<arr.length; i++)
        {
            writef("%d ", arr[i].value);
        }
        writeln();
    }

}


