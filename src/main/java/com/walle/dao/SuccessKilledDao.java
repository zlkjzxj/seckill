package com.walle.dao;

import com.walle.entity.SuccessKilled;
import org.apache.ibatis.annotations.Param;

/**
 * Created by walle
 * 2017/10/23.11:25
 * good good study!
 */
public interface SuccessKilledDao {
    /**
     * 插入购买明细，可过滤重复
     *
     * @param seckillId
     * @param userPhone
     * @return 表示插入的行数
     */
    int insertSuccessKilled(@Param("seckillId") long seckillId, @Param("userPhone") long userPhone);

    /**
     * 根据id查询SuccessKilled并携带秒杀产品对象实体
     * @param seckillId
     * @return
     */
    SuccessKilled queryByIdWithSeckill(long seckillId);


}
