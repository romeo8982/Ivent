package Models;

import java.util.Date;

public class Performance {

    private String name;
    private String description;
    private boolean shared;
    private Date publicationDate;

    public Performance(String name, String text, boolean shared, Date publicationDate) {
        this.name = name;
        this.description = text;
        this.shared = shared;
        this.publicationDate = publicationDate;
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

    public void setDescription(String text) {
        this.description = text;
    }

    public boolean isShared() {
        return shared;
    }

    public void setShared(boolean shared) {
        this.shared = shared;
    }

    public Date getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(Date publicationDate) {
        this.publicationDate = publicationDate;
    }

}
