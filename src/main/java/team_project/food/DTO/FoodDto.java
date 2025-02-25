package team_project.food.DTO;

public class FoodDto {

	
	private String country;
	private String city;
	private double lat;
	private double lng;
	private String f_name;
	private String f_img;
	private String f_des;
	private boolean liked;
	
	
	public FoodDto() {
		
	}
	
	
	public FoodDto(String country, String city, double lat, double lng, String f_name, String f_img, String f_des,
			boolean liked) {
		super();
		this.country = country;
		this.city = city;
		this.lat = lat;
		this.lng = lng;
		this.f_name = f_name;
		this.f_img = f_img;
		this.f_des = f_des;
		this.liked = liked;
	}


	public boolean getLiked() {
		return liked;
	}


	public void setLiked(boolean liked) {
		this.liked = liked;
	}


	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	public String getF_img() {
		return f_img;
	}

	public void setF_img(String f_img) {
		this.f_img = f_img;
	}

	public String getF_des() {
		return f_des;
	}

	public void setF_des(String f_des) {
		this.f_des = f_des;
	}

	
	
}