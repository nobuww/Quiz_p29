module student_score;

class StudentScore
{
    string mk_name;
    double score;
    int sks;

    double to_contribution(string grade)
    {
        double[string] contribution = [
            "A": 4,
            "A-": 3.7,
            "B+": 3.3,
            "B": 3,
            "B-": 2.7,
            "C+": 2.3,
            "C": 2,
            "C-": 1.7,
            "D": 1,
            "E": 0
        ];

        return contribution[grade];
    }

    string to_grade(double d)
    {
        if (d <= 45)
        {
            return "E";
        }
        else if (45 < d && d <= 50)
            return "D";
        else if (50 < d && d <= 55)
            return "C-";
        else if (55 < d && d <= 60)
            return "C";
        else if (60 < d && d <= 65)
            return "C+";
        else if (65 < d && d <= 70)
            return "B-";
        else if (70 < d && d <= 75)
            return "B";
        else if (75 < d && d <= 80)
            return "B+";
        else if (80 < d && d <= 85)
            return "A-";
        else
            return "A";
    }

    public static StudentScore getStudentScore(){
        return new StudentScore();
    }
}
