select territories.territoryid, territorydescription, employeeterritories.territoryid,employeeid
from territories
join employeeterritories
on territories.territoryid=employeeterritories.territoryid;

Display EmpID & TerritotyDescription












