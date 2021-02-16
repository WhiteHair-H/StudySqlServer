use BikeStores;
go

--  ������ ����Ʈ Ȯ��
select p.product_id, p.product_name, /*p.brand_id*/ 
	   b.brand_name , ct.category_name,
	   p.model_year,
	   format(p.list_price,'$ #,#.00') as list_price
  from production.products as p
  inner join production.categories as ct
  on p.category_id = ct.category_id
  inner join production.brands as b
  on p.brand_id = b.brand_id


-- �� �ֹ����, ������¥, �ֹ���¥ ����Ʈ Ȯ��
select od.order_id, concat(ct.first_name, ' ' ,ct.last_name) as full_name,
	   case od.order_status
	   when 1 then '�ֹ��Ϸ�'
	   when 2 then '�����Ϸ�' 
	   when 3 then '�����'
	   when 4 then '��ۿϷ�'
	   else '�̻����'
	   end as '�ֹ��ܰ�', 
	   od.order_date, od.required_date,
	   od.shipped_date, /*od.store_id, od.staff_id,*/
	   concat(st.first_name, ' ' ,st.last_name) as full_name_staffs,
	   sr.store_name
  from sales.orders as od
  inner join sales.customers as ct
  on od.customer_id = ct.customer_id
  inner join sales.staffs as st
  on od.staff_id = st.staff_id
  inner join sales.stores as sr
  on od.store_id = sr.store_id
  order by store_name desc