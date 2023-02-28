//switch condition
void main() {
  print('Switch condition');
  var grade = 'A';
  switch (grade) {
    case 'A':
      {
        print('Excellent');
      }
      break;
    case 'B':
      {
        print('Good');
      }
      break;
    case 'C':
      {
        print('Fair');
      }
      break;
    case 'D':
      {
        print('Poor');
      }
      break;
    default:
      {
        print('Invalid Choice');
      }
      break;
  }
}
