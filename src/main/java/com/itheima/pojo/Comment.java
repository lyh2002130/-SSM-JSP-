package com.itheima.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Comment {
    private Integer cmid;
    private Integer uid;
    private Integer pid;
    private String cmcontent;
    private String cmtime;
    private String cmimage;
    private Integer score;
}
