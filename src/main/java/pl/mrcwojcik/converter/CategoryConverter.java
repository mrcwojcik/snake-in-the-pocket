package pl.mrcwojcik.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import pl.mrcwojcik.entity.Category;
import pl.mrcwojcik.repositories.CategoryRepository;

public class CategoryConverter implements Converter<String, Category> {

    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    public Category convert(String s) {
        return categoryRepository.findById(Long.parseLong(s)).get();
    }
}
