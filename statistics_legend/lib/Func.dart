import 'dart:math';

List<double> data = [];
List<double> f = [];
//
double calculateMean(List<double> data, List<double> f) {
  double sum = 0, sumf = 0;

  for (int i = 0; i < data.length; i++) {
    sum += data[i] * f[i];
    sumf += f[i];
  }

  if (sumf != 0) {
    return sum / sumf;
  } else {
    // Handle the case where the sum of weights is zero to avoid division by zero.
    // You can return a special value, throw an exception, or handle it in a way that makes sense for your application.
    // For now, I'll return NaN (Not a Number) to indicate an undefined result.
    return double.nan;
  }
}

// حساب الوسيط (Median)
double calculateMedian(List<double> data, List<double> f) {
  // Create a list to store repeated values based on the weights
  List<double> repeatedValues = [];

  // Populate the repeatedValues list based on the weights
  for (int i = 0; i < data.length; i++) {
    for (int j = 0; j < f[i].toInt(); j++) {
      repeatedValues.add(data[i]);
    }
  }

  // Sort the list of repeated values
  repeatedValues.sort();

  int n = repeatedValues.length;

  // Check if the number of elements is even or odd
  if (n % 2 == 0) {
    // If the number of elements is even, calculate the average of the two middle elements
    int middle1 = (n ~/ 2) - 1;
    int middle2 = n ~/ 2;
    return (repeatedValues[middle1] + repeatedValues[middle2]) / 2;
  } else {
    // If the number of elements is odd, return the middle element
    int middle = n ~/ 2;
    return repeatedValues[middle];
  }
}

// حساب المتوسط الهندسي (Geometric Mean)
double calculateGeometricMean(List<double> data, List<double> f) {
  if (data.isEmpty || f.isEmpty || data.length != f.length) {
    // Handle the case of invalid input, you can return a special value or throw an exception.
    // For now, I'll return NaN (Not a Number) to indicate an undefined result.
    return double.nan;
  }

  double product = 1.0;
  int totalCount = 0;

  for (int i = 0; i < data.length; i++) {
    if (data[i] > 0 && f[i] > 0) {
      product *= pow(data[i], f[i]);
      totalCount += f[i].toInt();
    } else if (data[i] < 0 || f[i] < 0) {
      // Handle the case of negative values, you may want to throw an exception or handle it in a way that makes sense for your application.
      // For now, I'll return NaN to indicate an undefined result.
      return double.nan;
    }
    // Ignore zero values, as they would make the geometric mean undefined.
  }

  if (totalCount > 0) {
    return double.parse((pow(product, 1.0 / totalCount)).toString());
  } else {
    // Handle the case where there are no positive values or weights in the list.
    // You can return a special value or throw an exception.
    // For now, I'll return NaN to indicate an undefined result.
    return double.nan;
  }
}

// حساب الانحراف المعياري (Standard Deviation)
double calculateStandardDeviation(List<double> data, List<double> f) {
  if (data.isEmpty || f.isEmpty || data.length != f.length) {
    // Handle the case of invalid input, you can return a special value or throw an exception.
    // For now, I'll return NaN (Not a Number) to indicate an undefined result.
    return double.nan;
  }

  double mean = calculateMean(data, f);

  double sumSquaredDiff = 0.0;
  int totalCount = 0;

  for (int i = 0; i < data.length; i++) {
    if (f[i] > 0) {
      double diff = data[i] - mean;
      sumSquaredDiff += f[i] * diff * diff;
      totalCount += f[i].toInt();
    } else if (f[i] < 0) {
      // Handle the case of negative weights, you may want to throw an exception or handle it in a way that makes sense for your application.
      // For now, I'll return NaN to indicate an undefined result.
      return double.nan;
    }
    // Ignore zero weights, as they would not contribute to the standard deviation.
  }

  if (totalCount > 0) {
    double variance = sumSquaredDiff / totalCount;
    return sqrt(variance);
  } else {
    // Handle the case where there are no positive weights in the list.
    // You can return a special value or throw an exception.
    // For now, I'll return NaN to indicate an undefined result.
    return double.nan;
  }
}

// حساب المتوسط التناسبي (Harmonic Mean)
double calculateHarmonicMean(List<double> data, List<double> f) {
  if (data.isEmpty || f.isEmpty || data.length != f.length) {
    // Handle the case of invalid input, you can return a special value or throw an exception.
    // For now, I'll return NaN (Not a Number) to indicate an undefined result.
    return double.nan;
  }

  double reciprocalWeightedSum = 0.0;
  double weightSum = 0.0;

  for (int i = 0; i < data.length; i++) {
    if (data[i] == 0 || f[i] <= 0) {
      // Handle the case of zero values or non-positive weights, as they would make the weighted harmonic mean undefined.
      // You can return a special value or throw an exception.
      // For now, I'll return NaN to indicate an undefined result.
      return double.nan;
    } else {
      reciprocalWeightedSum += f[i] / data[i];
      weightSum += f[i];
    }
  }

  return weightSum / reciprocalWeightedSum;
}

// حساب الانحراف المتوسط (Mean Deviation)
double calculateMeanDeviation(List<double> data, List<double> f) {
  if (data.isEmpty || f.isEmpty || data.length != f.length) {
    // Handle the case of invalid input, you can return a special value or throw an exception.
    // For now, I'll return NaN (Not a Number) to indicate an undefined result.
    return double.nan;
  }

  double mean = calculateMean(data, f);
  double sumDeviation = 0.0;
  double weightSum = 0.0;

  for (int i = 0; i < data.length; i++) {
    if (f[i] > 0) {
      sumDeviation += f[i] * (data[i] - mean).abs();
      weightSum += f[i];
    } else if (f[i] < 0) {
      // Handle the case of negative weights, you may want to throw an exception or handle it in a way that makes sense for your application.
      // For now, I'll return NaN to indicate an undefined result.
      return double.nan;
    }
    // Ignore zero weights, as they would not contribute to the mean deviation.
  }

  if (weightSum > 0) {
    return sumDeviation / weightSum;
  } else {
    // Handle the case where there are no positive weights in the list.
    // You can return a special value or throw an exception.
    // For now, I'll return NaN to indicate an undefined result.
    return double.nan;
  }
}
