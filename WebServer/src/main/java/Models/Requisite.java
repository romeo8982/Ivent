package Models;

public class Requisite {
    private String name;
    private String description;
    private String picturePath;

    public Requisite(String name, String description, String picturePath) {
        this.name = name;
        this.description = description;
        this.picturePath = picturePath;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPicturePath() {
        return picturePath;
    }

    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }
}

