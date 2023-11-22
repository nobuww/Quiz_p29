module solver_p29;
import std.stdio;
import io;

class IndexedData {
    int value;
    int index;

    public this(int value, int index) {
        this.value = value;
        this.index = index;
    }

    static IndexedData[] constructList(int[] data) {
        IndexedData[] indices = new IndexedData[data.length];
        for(int i=0; i<data.length; i++) {
            indices[i] = new IndexedData(data[i], i+1);
        }
        return indices;
    }
}

void solve_sort_indexes(int[] data){
    IndexedData[] indexedData = IndexedData.constructList(data);

    foreach(_; 0..indexedData.length){
        foreach(j; 0..(indexedData.length)-1){
            if (indexedData[j].value > indexedData[j+1].value){
                swap(indexedData[j], indexedData[j+1]);
            }
        }
    }

    print!IndexedData.printValue(indexedData);
    print!IndexedData.printIndex(indexedData);
}

void swap(ref IndexedData a, ref IndexedData b){
    IndexedData temp = b;
    b = a;
    a = temp;
}
