## 登录
```sql
>sqlplus /nolog
SQL>conn sys/密码 as sysdba
SQL>

```

## 解锁账户
```sql
SQL>alter user scott account unlock;
```


## 修改密码
```sql
SQL>alter user 用户名 identified by 新密码

```