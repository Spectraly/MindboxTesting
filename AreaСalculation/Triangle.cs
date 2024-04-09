using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AreaСalculationLibrary.interfaces;

namespace AreaСalculationLibrary
{
    public class Triangle : IAreaСalculation
    {
        public double side_a {  get; set; } 
        public double side_b {  get; set; } 
        public double side_c {  get; set; }
        public Triangle(double a, double b, double c) {

            if (!(a > 0 && b > 0 & c > 0))
                throw new NotImplementedException("Значения сторон треугольника должны быть больше 0");
            side_a = a;
            side_b = b;
            side_c = c;
        }
        public double Area
        {
            get
            {
                var p = (side_a + side_b + side_c) / 2;
                return Math.Sqrt(p * (p - side_a) * (p - side_b) * (p - side_c));
            }
        }

        // Проверка треугольника на прямоугольность
        public bool CheckFigure()
        {
            var sqrtside_a = side_a * side_a;
            var sqrtside_b = side_b * side_b;
            var sqrtside_c = side_c * side_c;
            return  (sqrtside_a == sqrtside_b + sqrtside_c) ||
                    (sqrtside_b == sqrtside_a + sqrtside_c) ||
                    (sqrtside_c == sqrtside_a + sqrtside_b);
        }
    }
}
