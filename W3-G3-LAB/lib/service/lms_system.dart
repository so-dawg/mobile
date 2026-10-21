import '../model/score.dart';
import '../model/student.dart';
import '../model/course.dart';
import '../model/assignment.dart';

class LmsSystem {
  final List<Score> scores = [];
  final List<Student> students = [];
  final List<Course> courses = [];
  final List<Assignment> ass = [];

  void addStudent({required String studentId, required String studentName}) {
    // ! Student shall not exist already
    Student? student = _findStudentOrNull(studentId);
    if (student != null) {
      throw Exception('Student $student already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }

  void removeStudent({required String studentId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    // 1- Remove student from the students list
    students.removeWhere((student) => student.id == studentId);

    for (Course n in courses) {
      for (String s in n.studentIds) {
        if (s == studentId) {
          n.studentIds.remove(s);
        }
      }
    }
  }

  Student? _findStudentOrNull(String studentId) {
    for (Student s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null; // not found
  }

  void enrollStudent({required String studentId, required String courseId}) {
    Course? course = _findCourseOrNull(courseId);
    Student? student = _findStudentOrNull(studentId);
    if (course == null || student == null) {
      throw Exception('Course or student not exist!');
    }
    for (var n in course.studentIds) {
      if (n == studentId) {
        throw Exception('Student already exist!');
      }
    }

    course.studentIds.add(studentId);
  }

  void kickStudentOut({required String studentId, required String courseId}) {
    Course? course = _findCourseOrNull(courseId);
    Student? student = _findStudentOrNull(studentId);
    if (course == null || student == null) {
      throw Exception('Course or student not exist!');
    }

    String? sId;
    for (var n in course.studentIds) {
      if (n == studentId) {
        sId = n;
      }
    }

    if (sId == null) {
      throw Exception('student not exist');
    }

    course.studentIds.removeWhere((id) => id == studentId);
  }

  void addScore(
      {required String studentId1,
      required String courseId1,
      required double score1,
      required String scoreId}) {
    Course? course = _findCourseOrNull(courseId1);
    Student? student = _findStudentOrNull(studentId1);

    if (course == null || student == null) {
      throw Exception('Course or student not exist!');
    }

    for (var n in scores) {
      if (scoreId == n.id) {
        throw Exception('score id already exist');
      }
    }

    String? sId;
    for (var n in course.studentIds) {
      if (n == studentId1) {
        sId = n;
      }
    }

    if (sId == null) {
      throw Exception('student not in the course!');
    }

    if (score1 < 0 || score1 > 100) {
      throw Exception('correct ur score');
    }

    for (var n in scores) {
      if (n.studentId == studentId1 && n.courseId == courseId1) {
        throw Exception('Duplicate score data');
      }
    }

    scores.add(Score(
        studentId: studentId1,
        courseId: courseId1,
        score: score1,
        id: scoreId));
  }

  void removeScore({required String scoreId}) {
    //exist result
    String? si;
    for (var n in scores) {
      if (n.id == scoreId) {
        si = scoreId;
      }
    }

    if (si == null) {
      throw Exception('score not exist');
    }

    scores.removeWhere((score) => score.id == scoreId);
  }

  void addCourse({required String courseId, required String courseName}) {
    Course? course = _findCourseOrNull(courseId);
    if (course != null) {
      throw Exception('Course id ${course.id} already exists');
    }

    courses.add(Course(id: courseId, name: courseName));
  }

  void removeCourse({required String courseId}) {
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId not found');
    }
    // 1- Remove student from the students list
    courses.removeWhere((course) => course.id == courseId);
  }

  Course? _findCourseOrNull(String courseId) {
    for (Course s in courses) {
      if (s.id == courseId) {
        return s;
      }
    }
    return null; // not found
  }

  void addAssignmentToCourse(
      {required String courseId,
      required String assignment,
      required String assId,
      required String studentId}) {
    Course? course = _findCourseOrNull(courseId);
    Student? student = _findStudentOrNull(studentId);
    if (course == null || student == null) {
      throw Exception('Course not found!');
    }

    course.assIds.add(assId);
    ass.add(Assignment(id: assId, sId: studentId, des: assignment));
  }
}
