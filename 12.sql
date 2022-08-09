SELECT companyname,suppliers.supplierid,products.supplierid, orderid, quantity , order_details.productid,productname,products.productid
from order_details
 join products on order_details.productid=products.productid
 join suppliers on suppliers.supplierid= products.supplierid
where companyname = 'Exotic Liquids';













