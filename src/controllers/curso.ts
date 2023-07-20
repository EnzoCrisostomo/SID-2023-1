import prisma from "../prisma";
import { RequestHandler } from "express";
import HttpError from "http-errors";

const search: RequestHandler = async (req, res, next) => {
  return res.json({});
};
const detail: RequestHandler = async (req, res, next) => {
  return res.json({});
};
const searchEstruturaCurricular: RequestHandler = async (req, res, next) => {
  return res.json({});
};
const detailEstruturaCurricular: RequestHandler = async (req, res, next) => {
  return res.json({});
};
const searchDisciplinasEstruturaCurricular: RequestHandler = async (
  req,
  res,
  next
) => {
  return res.json({});
};

export default {
  search,
  detail,
  searchEstruturaCurricular,
  detailEstruturaCurricular,
  searchDisciplinasEstruturaCurricular,
};
