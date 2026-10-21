import 'package:lms_layered_architecture_example/model/course.dart';
import 'package:test/test.dart';
import '../service/lms_system.dart';

void main() {
  group('All the test task 1', () {
    test('add and remove course', () {
      final lms = LmsSystem();

      //create course
      lms.addCourse(courseId: 'C001', courseName: 'Mobile Development');
      expect(lms.courses.length, 1);

      //can't create duplicate course
      try {
        lms.addCourse(courseId: 'C001', courseName: 'PM');
      } catch (e) {
        print(e);
      }

      //remove course
      lms.removeCourse(courseId: 'C001');
      expect(lms.courses.length, 0);

      //can't remove course
      try {
        lms.removeCourse(courseId: 'C001');
      } catch (e) {
        print(e);
      }
    });
  });

  group('All test task 2', () {
    test('enroll student', () {
      final lms = LmsSystem();

      //reject enroll if course not exist
      lms.addStudent(studentId: 'S002', studentName: 'Gigi');
      try {
        lms.enrollStudent(studentId: 'S002', courseId: 'C001');
      } catch (e) {
        print(e);
      }

      lms.addCourse(courseId: 'C001', courseName: 'Dart');

      //reject enroll if student not exist
      try {
        lms.enrollStudent(studentId: 'S001', courseId: 'C001');
      } catch (e) {
        print(e);
      }

      lms.addStudent(studentId: 'S001', studentName: 'Ronan');

      //normal enroll student
      lms.enrollStudent(studentId: 'S001', courseId: 'C001');
      Course? course;
      for (Course n in lms.courses) {
        if (n.id == 'C001') {
          course = n;
        }
      }

      if (course != null) {
        expect(course.studentIds.length, 1);
      }

      try {
        lms.enrollStudent(studentId: 'S001', courseId: 'C001');
      } catch (e) {
        print(e);
      }
    });
  });

  group('All test task 3', () {
    test('remove student from a course', () {
      final lms = LmsSystem();

      //normal kick out student from course
      lms.addStudent(studentId: 'S001', studentName: 'Ronan');
      lms.addCourse(courseId: 'C001', courseName: 'Dart');
      lms.enrollStudent(studentId: 'S001', courseId: 'C001');
      lms.kickStudentOut(studentId: 'S001', courseId: 'C001');

      Course? course;
      for (Course n in lms.courses) {
        if (n.id == 'C001') {
          course = n;
        }
      }

      if (course != null) {
        expect(course.studentIds.length, 0);
      }

      //try to kickout the same student
      try {
        lms.kickStudentOut(studentId: 'S001', courseId: 'C001');
      } catch (e) {
        print(e);
      }
    });
  });

  group('All task 4', () {
    test('add result to course', () {
      final lms = LmsSystem();

      lms.addStudent(studentId: 'S001', studentName: 'Ronan');
      lms.addCourse(courseId: 'C001', courseName: 'Dart');
      lms.enrollStudent(studentId: 'S001', courseId: 'C001');

      //add score normal
      lms.addScore(
          studentId1: 'S001', courseId1: 'C001', score1: 80.0, scoreId: 'P001');
      expect(lms.scores.length, 1);

      try {
        lms.addScore(
            studentId1: 'S002',
            courseId1: 'C001',
            score1: 60.0,
            scoreId: 'P002');
      } catch (e) {
        print(e);
      }

      lms.addCourse(courseId: 'C002', courseName: 'c++');
      lms.enrollStudent(studentId: 'S001', courseId: 'C002');

      try {
        lms.addScore(
            studentId1: 'S001',
            courseId1: 'C002',
            score1: 60.0,
            scoreId: 'P003');
      } catch (e) {
        print(e);
      }

      try {
        lms.addScore(
            studentId1: 'S001',
            courseId1: 'C002',
            score1: 110.0,
            scoreId: 'P004');
      } catch (e) {
        print(e);
      }

      try {
        lms.addScore(
            studentId1: 'S001',
            courseId1: 'C002',
            score1: 100.0,
            scoreId: 'P001');
      } catch (e) {
        print(e);
      }

      try {
        lms.addScore(
            studentId1: 'S001',
            courseId1: 'C002',
            score1: 100.0,
            scoreId: 'P005');
      } catch (e) {
        print(e);
      }
    });
  });

  group('all task 5', () {
    test('remove result', () {
      final lms = LmsSystem();

      lms.addStudent(studentId: 'S001', studentName: 'Ronan');
      lms.addCourse(courseId: 'C001', courseName: 'Dart');
      lms.enrollStudent(studentId: 'S001', courseId: 'C001');

      //add score normal
      lms.addScore(
          studentId1: 'S001', courseId1: 'C001', score1: 80.0, scoreId: 'P001');

      lms.kickStudentOut(studentId: 'S001', courseId: 'C001');
      expect(lms.scores.length, 1);

      lms.removeScore(scoreId: 'P001');

      expect(lms.scores.length, 0);

      try {
        lms.removeScore(scoreId: 'P001');
      } catch (e) {
        print(e);
      }
    });
  });

  // test('creates a student', () {
  //   final lms = LmsSystem();
  //
  //   // Create a student
  //   lms.addStudent(studentId: 'S1', studentName: "ronan");
  //
  //   expect(lms.students.first.name, 'ronan');
  //
  //   // Remove the student
  //   lms.removeStudent(studentId: 'S1');
  //   expect(lms.students.length, 0);
  // });
  //
  // test("it's create student class and return 1 student", () {
  //   final lms = LmsSystem();
  //   lms.addStudent(studentId: '006', studentName: "tra");
  //   expect(lms.students.length, 1);
  // });
  //
  // group('lmsSystemaddCourse', () {
  //   test('creates course and test course', () {
  //     final lms = LmsSystem();
  //
  //     // create student
  //     lms.addCourse(courseId: 's21', courseName: 'gigi');
  //
  //   });
  // });
}
