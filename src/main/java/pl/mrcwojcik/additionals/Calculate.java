package pl.mrcwojcik.additionals;

import java.math.BigDecimal;

public class Calculate {

    private BigDecimal actualStatus;
    private BigDecimal goalStatus;
    private BigDecimal difference;

    public BigDecimal getActualStatus() {
        return actualStatus;
    }

    public void setActualStatus(BigDecimal actualStatus) {
        this.actualStatus = actualStatus;
    }

    public BigDecimal getGoalStatus() {
        return goalStatus;
    }

    public void setGoalStatus(BigDecimal goalStatus) {
        this.goalStatus = goalStatus;
    }

    public BigDecimal getDifference() {
        return difference;
    }

    public void setDifference(BigDecimal difference) {
        this.difference = difference;
    }

}
