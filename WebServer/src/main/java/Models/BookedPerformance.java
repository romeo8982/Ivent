package Models;

import java.util.Date;

public class BookedPerformance {
    private User illusionist;
    private User Company;
    private Date performanceDate;
    private Performance performance;

    public BookedPerformance(User illusionist, User company, Date performanceDate, Performance performance) {
        this.illusionist = illusionist;
        Company = company;
        this.performanceDate = performanceDate;
        this.performance = performance;
    }

    public User getIllusionist() {
        return illusionist;
    }

    public void setIllusionist(User illusionist) {
        this.illusionist = illusionist;
    }

    public User getCompany() {
        return Company;
    }

    public void setCompany(User company) {
        Company = company;
    }

    public Date getPerformanceDate() {
        return performanceDate;
    }

    public void setPerformanceDate(Date performanceDate) {
        this.performanceDate = performanceDate;
    }

    public Performance getPerformance() {
        return performance;
    }

    public void setPerformance(Performance performance) {
        this.performance = performance;
    }
}
