package Models;

public class TrickList {

    private Trick trick;
    private Performance performance;

    public TrickList(Trick trick, Performance performance) {
        this.trick = trick;
        this.performance = performance;
    }

    public Trick getTrick() {
        return trick;
    }

    public void setTrick(Trick trick) {
        this.trick = trick;
    }

    public Performance getPerformance() {
        return performance;
    }

    public void setPerformance(Performance performance) {
        this.performance = performance;
    }
}
