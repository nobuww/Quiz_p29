module solver;

import std.stdio;
import std.format;
import std.math.exponential;
import std.conv;
import student_list;
import student_score;


int[] solve_p1(int x){
    // prepare array to store result
    int[] result = new int[](2);
    result[0] = 1;
    result[result.length-1] = x;
    //int index = 2;
    for(int i=2;i<= x/2;i++){
        //writeln(i);
        if(x % i == 0){
            result.length++; // result.length = result.length + 1
            result[result.length - 1] = i;
            //index++; //index = index + 1;
        }
    }
    return result;
}

int solve_p2(int x, int depth){
    int[] limit = [3,4,8,pow(2, 32-1)-1];
    int[] basePrice = [1000, 1500, 2000, 3000];
    int price = 0;
    if(x <= limit[depth]){
        return x * basePrice[depth];
    }else {
        price += limit[depth]*basePrice[depth];
        //writeln(format("latest before error price: %d", price));
        int x2 = x - limit[depth];

        return price + solve_p2(x2, depth +1);
    }
}

void solve_p3 (int nmk){
    StudentScore[] student_score = new StudentList().constructList(nmk);

    for(int i=0;i<nmk;i++){
        writeln("Please enter Course Name, SKS Credit, Score separated by white space");
        readf("%s %d %e\n", student_score[i].mk_name, student_score[i].sks, &student_score[i].score);
    }

    writeln("Mata Kuliah \t SKS \t Nilai Angka \t Nilai Huruf \t Bobot");
    double ip = 0;
    int sum_sks = 0;
    for(int i=0;i<nmk;i++){
        StudentScore score = student_score[i];
        string grade = score.to_grade(score.score);
        double weight = score.to_contribution(grade);
        //writeln(format("%s \t %d \t %10.2f \t %s \t %10.2f \n", mk_list[i], 
        //    sks_list[i], score_list[i], grade, weight));
        writeln(format("%s \t %d \t %10.2f \t %s \t %10.2f \n", score.mk_name, 
            score.sks, score.score, grade, weight));
        ip += score.sks * weight;
        sum_sks += score.sks;
    }

    //printf("ip: %f\n ", ip);
    //printf("total sks: %f", sum_sks);
    double result = ip / sum_sks;
    writeln(text("Indeks Prestasi (IP): ", result));
}

string to_grade(double d){
    if(d <= 45){
        return "E";
    }
    else if(45 < d && d <= 50)
        return "D";
    else if(50 < d && d <= 55)
        return "C-";
    else if(55 < d && d <= 60)
        return "C";
    else if(60 < d && d<= 65)
        return "C+";
    else if(65 < d && d <= 70)
        return "B-";
    else if(70 < d && d <=  75)
        return "B";
    else if(75 < d && d <= 80)
        return "B+";
    else if(80 < d && d <= 85)
        return "A-";
    else
        return "A";
}
