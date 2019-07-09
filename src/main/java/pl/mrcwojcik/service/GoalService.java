package pl.mrcwojcik.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.mrcwojcik.additionals.Calculate;
import pl.mrcwojcik.additionals.GoalCalculate;
import pl.mrcwojcik.entity.Account;
import pl.mrcwojcik.repositories.GoalRepository;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Service
public class GoalService {

    @Autowired
    private GoalRepository goalRepository;

    public Calculate calculateGoal(GoalCalculate goalCalculate){
        Calculate calculate = new Calculate();
        calculate.setActualStatus(calculateActualStatus(goalCalculate));
        calculate.setDifference(calculateDifference(goalCalculate));
        calculate.setGoalStatus(calculateGoalStatus(goalCalculate));

        if (goalCalculate.getContribution().intValue() > 0){
            calculate.setTimeToGoal(calculateTimeToGoal(goalCalculate));
        }

        if (goalCalculate.getTime() > 0){
            calculate.setMonthContribution(calculateMonthContribution(goalCalculate));

        }

        return calculate;
    }

    public BigDecimal calculateMonthContribution(GoalCalculate goalCalculate){
        BigDecimal difference = calculateDifference(goalCalculate);
        System.out.println(difference);
        BigDecimal result = difference.divide(new BigDecimal(goalCalculate.getTime()), 2, RoundingMode.HALF_EVEN);
//        BigDecimal result2 = result.abs();
//        BigDecimal result3 = result.negate();
//        System.out.println(result3);
        return result;
    }

    public int calculateTimeToGoal(GoalCalculate goalCalculate){
        BigDecimal difference = calculateDifference(goalCalculate);
        BigDecimal result = difference.divide(goalCalculate.getContribution(), 2, RoundingMode.HALF_EVEN);
        return result.intValue();
    }


    public BigDecimal calculateActualStatus(GoalCalculate goalCalculate){
        BigDecimal sum = BigDecimal.ZERO;
        for (Account a : goalCalculate.getAccounts()){
            sum = sum.add(a.getActualBalance());
        }
        return sum;
    }

    public BigDecimal calculateDifference(GoalCalculate goalCalculate){
        BigDecimal sum = calculateActualStatus(goalCalculate);
        return sum.subtract(goalCalculate.getGoal().getGoalValue());
    }


        public BigDecimal calculateGoalStatus(GoalCalculate goalCalculate){
        BigDecimal sum = calculateActualStatus(goalCalculate);
        if (sum.compareTo(BigDecimal.ZERO) == 0){
            return BigDecimal.ZERO;
        } else if (sum.compareTo(BigDecimal.ZERO) == -1){
            return BigDecimal.ZERO;
        }

        return sum.multiply(new BigDecimal(100)).divide(goalCalculate.getGoal().getGoalValue());
    }



}
