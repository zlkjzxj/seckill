package com.walle.dao;

import com.walle.entity.Seckill;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by walle
 * 2017/10/24.9:47
 * good good study!
 */

//配置spring 和junit整合，为了Junit启动时加载spingIOC容器
@RunWith(SpringJUnit4ClassRunner.class)
// 高速junit spring配置文件
@ContextConfiguration("classpath:spring/spring-config.xml")
public class SeckillDaoTest {
    @Resource
    private SeckillDao seckillDao;

    @Test
    public void reduceNumber() throws Exception {
        int count = seckillDao.reduceNumber(1000, new Date());
        System.out.println(count);
    }

    @Test
    public void queryById() throws Exception {
        Seckill seckill = seckillDao.queryById(1000);
        System.out.println(seckill);
    }

    @Test
    public void queryAll() throws Exception {
        //java没有保存形参的记录 queryAll(0, 100)-->queryAll(arg0, agr1) 需要再接口添加@Param
        List<Seckill> list = seckillDao.queryAll(0, 100);
        for (Seckill seckill : list) {
            System.out.println(seckill);
        }
    }

}