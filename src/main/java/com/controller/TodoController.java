package com.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.model.Todo;
import com.repository.TodoRepository;

@Controller
public class TodoController {

    @Autowired
    private TodoRepository todoRepository;

    @GetMapping("/")
    public ModelAndView getAllTodos() {
        ModelAndView mav = new ModelAndView("list-todos");
        mav.addObject("todos", todoRepository.findAll());
        return mav;
    }

    @GetMapping("/add")
    public ModelAndView showAddForm() {
        ModelAndView mav = new ModelAndView("todo-form");
        mav.addObject("todo", new Todo());
        mav.addObject("mode", "ADD");
        return mav;
    }

    @PostMapping("/save")
    public String saveTodo(@ModelAttribute Todo todo) {
        if(todo.getId() == null) {
            todo.setCreatedAt(LocalDateTime.now());
        }
        todoRepository.save(todo);
        return "redirect:/";
    }

    @GetMapping("/edit/{id}")
    public ModelAndView showEditForm(@PathVariable Long id) {
        ModelAndView mav = new ModelAndView("todo-form");
        Todo todo = todoRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid todo Id:" + id));
        mav.addObject("todo", todo);
        mav.addObject("mode", "EDIT");
        return mav;
    }

    @GetMapping("/delete/{id}")
    public String deleteTodo(@PathVariable Long id) {
        todoRepository.deleteById(id);
        return "redirect:/";
    }
}