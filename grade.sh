# The path to JUnit wasnt working after you moved to grading-area
# So you wrote ../ to go back one step, and put a ; at the end of the file path
# to signify that it is two separate paths. 
CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

expected="student-submission/ListExamples.java"
if [[  ! -f "$expected"  ]]
then 
    echo "You did not submit the correct file. Please submit the correct file: $expected"
    exit 1
fi

cp -r student-submission grading-area
# This gets the test file into the grading area
cp TestListExamples.java grading-area
cp -r lib grading-area

#You are not in the proper directory so you have to move in
cd grading-area
# echo `pwd`

# This is to compile the files INSIDE OF grading-area
javac -cp $CPATH *.java */*.java

# Copied from lab 3
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples
# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
