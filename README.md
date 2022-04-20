# Cinema-Database-with-PL-SQL

### ER Diagram
<img width="884" alt="Снимок экрана 2022-04-20 в 16 52 29" src="https://user-images.githubusercontent.com/77274898/164215575-501c9d81-6215-4a94-af78-8210dfe2d3e8.png">

**Link:** 
https://lucid.app/lucidchart/9f18f12a-7dcd-4832-9bf7- e5f378e6ab70/edit?invitationId=inv_15a03e6e-e68e-49d0-a67c-14d2ad08b8ea

### Description of attributes with their entities added into documentation.

### Business rules:
1. Cinema has own store. (1:1)

2. Cinema has many departments. (1:M)

3. Department hire employees. (1:M)

4. Cinema has multiple halls. (1:M)

5. Movie can be shown in different halls, but hall can show only one movie. (1:M) 

6. Customers selects one or many movies. (M:M)

7. Movies are shown according to schedule. (1:M)

8. Employees serve many customers. (M:M)

9. Each employee can sell many tickets. (1:M)

10. Customer can get many tickets. (1:M)


11. Only one ticket to one movie. (1:1)

12. Customer can book online. (1:M)

13. Only one payment is allowed to one booking. (1:1)

14. Customer can book many movies. (1:M)
