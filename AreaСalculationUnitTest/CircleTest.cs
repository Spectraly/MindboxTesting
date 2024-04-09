using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AreaСalculationLibrary;

namespace AreaСalculationUnitTest
{
    [TestClass]
    public class CircleTest
    {
        [TestMethod]
        [ExpectedException(typeof(NotImplementedException),
            "Радиус круга должен быть больше 0")]
        public void CircleArea0_ThrowsException()
        {
            Circle circle = new Circle(0);
        }

        [TestMethod]
        public void CircleArea10_314Returned()
        {
            //arrange
            Circle circle = new Circle(10);
            var circleArea10 = Math.PI * Math.Pow(10, 2);
            //act
            var area = circle.Area;
            //assert
            Assert.AreEqual(circleArea10, area);
        }
    }
}