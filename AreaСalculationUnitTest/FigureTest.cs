using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AreaСalculationLibrary;

namespace AreaСalculationUnitTest
{
    [TestClass]
    public class FigureTest
    {
        [TestMethod]
        public void CustomAreaCircle10_314Returned()
        {
            //arrange
            Figure customfigure = new Figure(new Circle(10));
            var circleArea10 = Math.PI * Math.Pow(10, 2);
            //act
            var area = customfigure.Area;
            //assert
            Assert.AreEqual(circleArea10, area);
        }
        [TestMethod]
        public void CustomAreaTriangle345_6Returned()
        {
            //arrange
            Triangle triangle = new Triangle(3, 4, 5);
            //act
            var area = triangle.Area;
            //assert
            Assert.AreEqual(6, area);
        }
    }
}
