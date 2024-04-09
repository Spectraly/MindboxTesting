using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using AreaСalculationLibrary.interfaces;

namespace AreaСalculationLibrary
{
    public class Figure : IAreaСalculation
    {
        private IAreaСalculation figure;
        public double Area { get { return figure.Area; } }

        public Figure(IAreaСalculation figure)
        {
            this.figure = figure;
        }
    }
}
