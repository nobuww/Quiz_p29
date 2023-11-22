module student_list;
import student_score;

class StudentList{
    // = new StudentScore[3];
    
    public StudentScore[] constructList(int countMK){
        StudentScore[] student_scores = new StudentScore[countMK];
        for(int i;i<student_scores.length;i++)
        {
            student_scores[i] = new StudentScore();
        }
        return student_scores;
    }
}