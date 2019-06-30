package pl.mrcwojcik.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.mrcwojcik.entity.Goal;
import pl.mrcwojcik.repositories.GoalRepository;

public class GoalConverter implements Converter<String, Goal> {

    @Autowired
    private GoalRepository goalRepository;

    @Override
    public Goal convert(String s) {
        return goalRepository.findById(Long.parseLong(s)).get();
    }
}
