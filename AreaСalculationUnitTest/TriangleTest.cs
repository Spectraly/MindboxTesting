using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AreaСalculationLibrary;

namespace AreaСalculationUnitTest
{
    [TestClass]
    public class TriangleTest
    {
        [ExpectedException(typeof(NotImplementedException),
            "Значения сторон треугольника должны быть больше 0")]
        public void TriangleArea000_ThrowsException()
        {
            Triangle triangle = new Triangle(0,0,0);
        }

        [TestMethod]
        public void TriangleArea345_6Returned()
        {
            //arrange
            Triangle triangle = new Triangle(3, 4, 5);
            //act
            var area = triangle.Area;
            //assert
            Assert.AreEqual(6, area);
        }

        [TestMethod]
        public void TriangleIsRight_TrueReturned()
        {
            //arrange
            Triangle triangle = new Triangle(3, 4, 5);
            //act
            bool isRight = triangle.CheckFigure();
            //assert
            Assert.IsTrue(isRight);
        }
    }
}