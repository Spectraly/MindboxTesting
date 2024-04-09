using AreaСalculationLibrary.interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AreaСalculationLibrary
{
    public class Circle : IAreaСalculation
    {
        public double radius { get; set; }

        public Circle(double r)
        {
            if (!(r > 0))
                throw new NotImplementedException("Радиус круга должен быть больше 0");
            radius = r;
        }

        public double Area{get{return Math.PI * Math.Pow(radius, 2);}}
    }
}
