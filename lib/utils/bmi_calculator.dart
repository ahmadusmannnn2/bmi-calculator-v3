class BMICalculator {
  static double calculateBMI(double weight, double height) {
    return weight / ((height / 100) * (height / 100));
  }

  static String getStatus(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}
