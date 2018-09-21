package com.augustars.mall.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="sys_menu")
public class Menu implements Serializable {
	private static final long serialVersionUID = 1L;
	private Long menuId;
	private Menu parent;       // 上级菜单
	private String text;       // 菜单名
	private String icon;       // 菜单图标
	private String url;        // 菜单地址
	private Status status;
	private User createUser;
	private Date createTime;
	private User updateUser;
	private Date updateTime;
	private List<Menu> childMenuList;
	private List<Role> roleList;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Long getMenuId() {
		return menuId;
	}
	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}
	
	@ManyToOne(targetEntity=Menu.class,
			cascade={CascadeType.PERSIST, CascadeType.MERGE})
	@JoinColumn(name="parent_id")
	public Menu getParent() {
		return parent;
	}
	public void setParent(Menu parent) {
		this.parent = parent;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@ManyToOne(targetEntity=Status.class, fetch=FetchType.EAGER,
			cascade= {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinColumn(name="status_id")
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	
	@ManyToOne(targetEntity=User.class, fetch=FetchType.EAGER,
			cascade= {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinColumn(name="create_user")
	public User getCreateUser() {
		return createUser;
	}
	public void setCreateUser(User createUser) {
		this.createUser = createUser;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@ManyToOne(targetEntity=User.class, fetch=FetchType.EAGER,
			cascade= {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinColumn(name="update_user")
	public User getUpdateUser() {
		return updateUser;
	}
	public void setUpdateUser(User updateUser) {
		this.updateUser = updateUser;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	@OneToMany(targetEntity=Menu.class, mappedBy="parent", fetch=FetchType.EAGER,
			cascade={CascadeType.PERSIST, CascadeType.MERGE})
	public List<Menu> getChildMenuList() {
		return childMenuList;
	}
	public void setChildMenuList(List<Menu> childMenuList) {
		this.childMenuList = childMenuList;
	}
	
	@ManyToMany(targetEntity=Role.class,
			cascade={CascadeType.PERSIST, CascadeType.MERGE})
	@JoinTable(name="sys_role_menu",
			joinColumns={@JoinColumn(name="menu_id")},
			inverseJoinColumns={@JoinColumn(name="role_id")})
	public List<Role> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
	
	
}
