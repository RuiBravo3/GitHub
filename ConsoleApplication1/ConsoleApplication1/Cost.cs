using System;

namespace ConsoleApplication1
{
    public class Cost
    {
        public double[] value;
        public string heuristic { get; }
        public Cost(int h)
        {
            switch (h)
            {
                case 1:
                    {
                        euclidean();
                        heuristic = "euclidean";
                        break;
                    }
                case 2:
                    {
                        manhattan();
                        heuristic = "manhattan";
                        break;
                    }
                case 3:
                    {
                        pogoda();
                        heuristic = "pogoda";
                        break;
                    }
                default:
                    {
                        euclidean();
                        heuristic = "euclidean";
                        break;
                    }
            }
        }

        private void pogoda()
        {
            value = new double[49]
            {
                double.MaxValue, double.MaxValue, -0.3, 0.4, 0.0, double.MaxValue, double.MaxValue,
                double.MaxValue, double.MaxValue, 1.0, 0.0, 1.0, double.MaxValue, double.MaxValue,
                                    0.5, 0.0, 0.5, 0.4, 0.1, 0.3, -0.1,
                                    0.0, 0.9, 0.7, 0.3, 0.9, 1.1, 0.4,
                                    0.5, 0.6, 0.1, 0.5, 0.2, 0.6, 0.2,
                double.MaxValue, double.MaxValue, 0.8, 0.0, 0.8, double.MaxValue, double.MaxValue,
                double.MaxValue, double.MaxValue, 0.0, 0.5, -0.2, double.MaxValue, double.MaxValue
            };
        }

        private void manhattan()
        {
            value = new double[49]
            {
                double.MaxValue, double.MaxValue, 4, 3, 4, double.MaxValue, double.MaxValue,
                double.MaxValue, double.MaxValue, 3, 2, 3, double.MaxValue, double.MaxValue,
                                            4, 3, 2, 1, 2, 3, 4,
                                            3, 2, 1, 0, 1, 2, 3,
                                            4, 3, 2, 1, 2, 3, 4,
                double.MaxValue, double.MaxValue, 3, 2, 3, double.MaxValue, double.MaxValue,
                double.MaxValue, double.MaxValue, 4, 3, 4, double.MaxValue, double.MaxValue
            };
        }

        private void euclidean()
        {
            value = new double[49]
            {
                double.MaxValue, double.MaxValue, 3, 3, 3, double.MaxValue, double.MaxValue,
                double.MaxValue, double.MaxValue, 2, 2, 2, double.MaxValue, double.MaxValue,
                                            3, 2, 1, 1, 1, 2, 3,
                                            3, 2, 1, 0, 1, 2, 3,
                                            3, 2, 1, 1, 1, 2, 3,
                double.MaxValue, double.MaxValue, 2, 2, 2, double.MaxValue, double.MaxValue,
                double.MaxValue, double.MaxValue, 3, 3, 3, double.MaxValue, double.MaxValue
            };
        }

        public double getCost(int x , int y)
        {
            return value[y * 7 + x];
        }
    }
}