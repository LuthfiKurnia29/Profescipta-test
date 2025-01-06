using ClosedXML.Excel;
using DocumentFormat.OpenXml.Spreadsheet;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProfesciptaTestMVC.Models;
using ProfesciptaTestMVC.ViewModels;
using System.Diagnostics;
using System.Globalization;
using Item = ProfesciptaTestMVC.Models.Item;

namespace ProfesciptaTestMVC.Controllers
{
    public class OrderController : Controller
    {
        private AppDbContext _context;

        public OrderController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Add()
        {
            var user = _context.Customers.ToList();
            Debug.WriteLine(user);
            ViewBag.User = user;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> AddLogic(InputOrder model)
        {
            try
            {
                Debug.WriteLine(model);
                var newOrder = new Order()
                {
                    OrderDate = model.OrderDate,
                    OrderNo = model.OrderNumber,
                    Address = model.Address,
                    CustomerId = model.CustomerId
                };
                _context.Orders.Add(newOrder);
                _context.SaveChanges();

                foreach(var item in model.Items)
                {
                    var newItem = new Item()
                    {
                        ItemName = item.ItemName,
                        OrderId = newOrder.Id,
                        Quantity = item.Quantity,
                        Price = item.Price
                    };
                    _context.Items.Add(newItem);
                }
                await _context.SaveChangesAsync();

            }catch(Exception e)
            {
                return BadRequest(e.InnerException?.Message);
            }
            return RedirectToAction("Index", "Home");
        }

        public IActionResult Edit(long id)
        {
            var order = _context.Orders.Where(x => x.Id == id).FirstOrDefault();
            var user = _context.Customers.ToList();
            ViewBag.User = user;
            if (order != null)
            {
                var itemOrder = _context.Items.Where(x => x.OrderId == id).ToList();
                Debug.WriteLine(itemOrder);
                ViewBag.Item = itemOrder;
                return View(order);
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }

        public IActionResult EditLogic(InputOrder model)
        {
            try
            {
                Debug.WriteLine(model);
                var order = _context.Orders.Where(x => x.Id == model.Id).FirstOrDefault();
                if(order != null)
                {
                    order.OrderNo = model.OrderNumber;
                    order.Address = model.Address;
                    order.OrderDate = model.OrderDate;
                    order.CustomerId = model.CustomerId;
                    _context.Orders.Update(order);
                    _context.SaveChanges();
                    foreach (var item in model.Items)
                    {
                        var existsItem = _context.Items.Where(x => x.Id == item.Id).FirstOrDefault();
                        if(existsItem != null)
                        {
                            /*var itmExt = new Item()
                            {
                                Id = existsItem.Id,
                                ItemName = item.ItemName,
                                OrderId = order.Id,
                                Price = item.Price,
                                Quantity = item.Quantity
                            };*/
                            existsItem.ItemName = item.ItemName;
                            existsItem.OrderId = order.Id;
                            existsItem.Price = item.Price;
                            existsItem.Quantity = item.Quantity;
                            _context.Items.Update(existsItem);
                            _context.SaveChanges();
                        }
                        else
                        {
                            var itmExt = new Item()
                            {
                                ItemName = item.ItemName,
                                OrderId = order.Id,
                                Price = item.Price,
                                Quantity = item.Quantity,
                            };
                            _context.Items.Add(itmExt);
                            _context.SaveChanges();
                        }
                        
                    }
                }
                return RedirectToAction("Index", "Home");
            }catch(Exception e)
            {
                return BadRequest(e.InnerException?.Message);
            }
        }

        [HttpPost]
        public IActionResult Delete(long id)
        {
            try
            {
                var order = _context.Orders.Where(x => x.Id == id).FirstOrDefault();
                Debug.WriteLine(order);
                if(order != null)
                {
                    var items = _context.Items.Where(x => x.OrderId == order.Id).ToList();
                    Debug.WriteLine(items);
                    _context.Items.RemoveRange(items);
                    _context.Orders.Remove(order);
                    _context.SaveChanges();
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    return BadRequest("Order Not Found");
                }
            }catch(Exception e)
            {   
                return BadRequest(e.InnerException?.Message);
            }
        }

        [HttpPost]
        public ActionResult ExportToExcel()
        {
            // Data
            var listItem = _context.Items.Include(c => c.Order.Customer).ToList();

            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("Items");
                // Header
                worksheet.Cell(1, 1).Value = "Order Number";
                worksheet.Cell(1, 2).Value = "Order Date";
                worksheet.Cell(1, 3).Value = "Customer";
                worksheet.Cell(1, 4).Value = "Order Item";
                worksheet.Cell(1, 5).Value = "Quantity";
                worksheet.Cell(1, 6).Value = "Price";

                // Data
                for (int i = 0; i < listItem.Count; i++)
                {
                    worksheet.Cell(i + 2, 1).Value = listItem[i].Order.OrderNo;
                    worksheet.Cell(i + 2, 2).Value = listItem[i].Order.OrderDate.ToString("dd MMMM yyyy");
                    worksheet.Cell(i + 2, 3).Value = listItem[i].Order.Customer.Name;
                    worksheet.Cell(i + 2, 4).Value = listItem[i].ItemName;
                    worksheet.Cell(i + 2, 5).Value = listItem[i].Quantity;
                    worksheet.Cell(i + 2, 6).Value = listItem[i].Price;
                }

                // Simpan ke stream
                using (var stream = new MemoryStream())
                {
                    workbook.SaveAs(stream);
                    var fileBytes = stream.ToArray(); // Salin konten stream ke array byte
                    return File(fileBytes, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "Users.xlsx");
                }
            }
        }
    }
}
