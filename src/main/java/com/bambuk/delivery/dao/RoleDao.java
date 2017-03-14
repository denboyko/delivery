package com.bambuk.delivery.dao;


import com.bambuk.delivery.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleDao extends JpaRepository<Role, Long> {
}